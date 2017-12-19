class PassportDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Passport.id", cond: :eq },
      name: { source: "Passport.name", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name
      }
    end
  end

  private

  def get_raw_records
    Passport.all
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  def sortable_columns
    @sortable_columns ||= ['Passport.name']
  end

  def searchable_columns
    @searchable_columns ||= ['Passport.name']
  end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
