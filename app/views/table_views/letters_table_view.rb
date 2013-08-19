class LettersTableView < UITableView
  CELL_IDENTIFIER = 'CELL_IDENTIFIER'

  def initWithFrame(frame)
    super.tap do |table_view|
      table_view.translatesAutoresizingMaskIntoConstraints = false

      table_view.dataSource    = data_source
      table_view.scrollEnabled = false

      table_view.layoutIfNeeded
    end
  end

  def intrinsicContentSize
    @contentSize ||= begin
      layoutIfNeeded

      contentSize
    end
  end

  def data_source
    @data_source ||= LetterDataSource.new
  end
end
