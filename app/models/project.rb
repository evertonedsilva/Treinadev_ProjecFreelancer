class Project < ApplicationRecord
    belongs_to :employer
    enum status: {open: 5, running: 10, canceled: 20, closed: 30}
end
