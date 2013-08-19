class GridCell < UICollectionViewCell
  IDENTIFIER = 'GridIdentifier'
  SIZE       = CGSizeMake(96, 96)

  def initWithFrame(frame)
    super.tap do |cell|
      cell.setup_constraints
    end
  end

  def setup_constraints
    Motion::Layout.new do |layout|
      layout.view       contentView
      layout.subviews   'label' => label
      layout.horizontal '|[label]|'
      layout.vertical   '|[label]|'
    end
  end

  def label
    @label ||= UILabel.alloc.init.tap do |label|
      label.backgroundColor = UIColor.blackColor
      label.textColor       = UIColor.whiteColor
      label.textAlignment   = NSTextAlignmentCenter
    end
  end
end
