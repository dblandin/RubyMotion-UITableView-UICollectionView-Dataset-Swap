class DataSourceSwapController < UIViewController
  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor

    setup_constraints
  end

  def setup_constraints
    Motion::Layout.new do |layout|
      layout.view       view
      layout.subviews   subviews_dict
      layout.horizontal '|[table]|'
      layout.vertical   '|[table]|'
    end
  end

  def subviews_dict
    { 'table'  => table }
  end

  def table
    @table ||= UITableView.alloc.init.tap do |table_view|
      table_view.tableHeaderView = header
      table_view.dataSource      = letter_data_source
    end
  end

  def letter_data_source
    @letter_data_source ||= LetterDataSource.new
  end

  def number_data_source
    @number_data_source ||= NumberDataSource.new
  end

  def header
    @header ||= HeaderView.alloc.initWithFrame([[0, 0], [view.size.width, 50]]).tap do |header|
      header.delegate = WeakRef.new(self)
    end
  end

  def did_select(option)
    case option
    when 'letters'
      table.dataSource = letter_data_source
    when 'numbers'
      table.dataSource = number_data_source
    end

    table.reloadData
  end
end
