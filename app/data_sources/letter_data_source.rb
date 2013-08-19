class LetterDataSource
  CELL_IDENTIFIER = 'LETTER_CELL_IDENTIFIER'

  def tableView(table_view, numberOfRowsInSection: section)
    letters.count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    UITableViewCell.alloc.initWithStyle(
      UITableViewCellStyleDefault,
      reuseIdentifier: CELL_IDENTIFIER).tap do |cell|
        cell.textLabel.text = letters[index_path.row]
    end
  end

  def letters
    ('A'..'Z').to_a
  end
end
