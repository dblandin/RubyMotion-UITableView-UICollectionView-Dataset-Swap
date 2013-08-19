class NumberDataSource
  CELL_IDENTIFIER = 'NUMBER_CELL_IDENTIFIER'

  def tableView(table_view, numberOfRowsInSection: section)
    numbers.count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    UITableViewCell.alloc.initWithStyle(
      UITableViewCellStyleDefault,
      reuseIdentifier: CELL_IDENTIFIER).tap do |cell|
        cell.textLabel.text = numbers[index_path.row]
    end
  end

  def numbers
    ('1'..'100').to_a
  end
end
