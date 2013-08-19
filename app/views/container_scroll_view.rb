class ContainerScrollView < UIScrollView
  def initWithFrame(frame)
    super.tap do |scroll_view|
      scroll_view.setup_constraints
    end
  end

  def setup_constraints
    Motion::Layout.new do |layout|
      layout.view       self
      layout.subviews   subviews_dict
      layout.horizontal '|[header]|'
      layout.vertical   '|[header]'
    end

    setup_table
  end

  def subviews_dict
    { 'header' => header }
  end

  def did_select(option)
    case option
    when 'letters'
      setup_table
    when 'numbers'
      setup_collection
    end
  end

  def setup_table
    teardown(collection)

    addSubview(table)

    add_constraints_for(table)
  end

  def setup_collection
    teardown(table)

    addSubview(collection)

    add_constraints_for(collection, 5)
  end

  def add_constraints_for(subview, margin = 0)
    view_constraints << NSLayoutConstraint.constraintsWithVisualFormat(
      'H:|-margin-[view]-margin-|',
      options: 0,
      metrics: { 'margin' => margin },
      views: { 'view' => subview })

    view_constraints << NSLayoutConstraint.constraintsWithVisualFormat(
      'V:[header]-margin-[view]-margin-|',
      options: 0,
      metrics: { 'margin' => margin },
      views: { 'header' => header, 'view' => subview })

    addConstraints(view_constraints.flatten!)
  end

  def teardown(subview)
    subview.removeFromSuperview

    removeConstraints(view_constraints)

    view_constraints.clear
  end

  def view_constraints
    @view_constraints ||= []
  end

  def header
    @header ||= HeaderView.alloc.init.tap do |header|
      header.delegate = WeakRef.new(self)
    end
  end

  def table
    @table_view ||= LettersTableView.alloc.init
  end

  def collection
    @collection ||= NumbersCollectionView.alloc.initWithFrame(
      CGRectZero,
      collectionViewLayout: NumbersCollectionView.layout)
  end
end
