class ContractType < ActiveRecord::Base
    has_many :contracts, foreign_key: "contract_type"
end
