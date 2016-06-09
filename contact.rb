class Contact
  attr_reader :id, :created_at, :updated_at
  attr_accessor :name, :phone, :email

  def initialize(args = {})
    assign_attributes(args)
  end

  def destroy
    $db.execute("DELETE FROM contacts WHERE id = ?", self.id)
  end

  def save
    persisted? ? update : insert
    return self
  end

  def self.count
    $db.get_first_value("SELECT COUNT() FROM contacts;")
  end

  def self.all
    contacts_from($db.execute("SELECT * FROM contacts;"))
  end

  def self.where(conditions)
    contacts_from($db.execute("SELECT * FROM contacts WHERE #{build_conditions_with_placeholders(conditions.keys)};", *conditions.values))
  end

  def self.find(id)
    contacts_from($db.execute("SELECT * FROM contacts WHERE id = ? LIMIT 1", id)).first
  end

  private
  attr_writer :id

  def created_at=(date)
    @created_at = date_from(date)
  end

  def updated_at=(date)
    @updated_at = date_from(date)
  end

  def date_from(date)
    return date if date.kind_of? Date
    DateTime.parse(date)
  end

  def assign_attributes(args = {})
    self.id         = args["id"]         if args["id"]
    self.name       = args["name"]       if args["name"]
    self.phone      = args["phone"]      if args["phone"]
    self.email      = args["email"]      if args["email"]
    self.created_at = args["created_at"] if args["created_at"]
    self.updated_at = args["updated_at"] if args["updated_at"]
  end

  def persisted?
    !id.nil?
  end

  def insert
    $db.execute("INSERT INTO contacts (name, phone, email, created_at, updated_at) VALUES (?, ?, ?, DATETIME('now'), DATETIME('now'));", self.name, self.phone, self.email)
    assign_attributes($db.execute("SELECT * FROM contacts WHERE id = ? LIMIT 1", $db.last_insert_row_id).first)
  end

  def update
    $db.execute("UPDATE contacts SET name = ?, phone = ?, email = ?, updated_at = DATETIME('now') WHERE id = ?", self.name, self.phone, self.email, self.id)
    assign_attributes($db.execute("SELECT * FROM contacts WHERE id = ? LIMIT 1", self.id).first)
  end

  def self.contacts_from(results)
    results.map { |group_data| new(group_data) }
  end

  def self.build_conditions_with_placeholders(columns)
    columns.map { |column| "#{column} = ?" }.join(" AND ")
  end
end



