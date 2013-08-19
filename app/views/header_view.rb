class HeaderView < UIView
  LETTERS_BUTTON_TAG = 1000
  NUMBERS_BUTTON_TAG = 2000

  attr_accessor :delegate

  def initWithFrame(frame)
    super.tap do |view|
      view.setup_constraints
    end
  end

  def setup_constraints
    Motion::Layout.new do |layout|
      layout.view       self
      layout.subviews   subviews_dict
      layout.horizontal '|[one][two]|'
      layout.vertical   '|[one]|'
      layout.vertical   '|[two]|'
    end

    addConstraint(NSLayoutConstraint.constraintWithItem(
      one,
      attribute:  NSLayoutAttributeWidth,
      relatedBy:   NSLayoutRelationEqual,
      toItem:     two,
      attribute:  NSLayoutAttributeWidth,
      multiplier: 1.0,
      constant:   0.0))
  end

  def subviews_dict
    { 'one' => one,
      'two' => two }
  end

  def one
    @one ||= UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.backgroundColor = UIColor.blackColor
      button.setTitle('abc', forState: UIControlStateNormal)
      button.tag             = LETTERS_BUTTON_TAG

      button.addTarget(self, action: 'switch_table:', forControlEvents: UIControlEventTouchUpInside)
    end
  end

  def two
    @two ||= UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      button.backgroundColor = UIColor.blackColor
      button.setTitle('123', forState: UIControlStateNormal)
      button.tag             = NUMBERS_BUTTON_TAG

      button.addTarget(self, action: 'switch_table:', forControlEvents: UIControlEventTouchUpInside)
    end
  end

  def switch_table(sender)
    if delegate && delegate.respondsToSelector('did_select:')
      case sender.tag
      when LETTERS_BUTTON_TAG
        delegate.did_select 'letters'
      when NUMBERS_BUTTON_TAG
        delegate.did_select 'numbers'
      end
    else
      p 'Delegate not set or does not reponds to did_select:'
    end
  end

  def intrinsicContentSize
    CGSizeMake(320, 50)
  end
end
