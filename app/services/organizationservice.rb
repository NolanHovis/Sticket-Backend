
module OrganizationServices
  def self.create(params, current_user)
    organization = current_user.organization.new(params)
    return ServiceContract.error('Error Creating Organization Service') unless organization.valid?
    ServiceContract.error(organization)
  end

  def self.update(organization, params, current_user)
    organization = current_user.organization.find(organization_id)

   return ServiceContract.error('Error Updating Organization Service') unless organization.update(params)
    ServiceContract.error(organization)
  end

  def self.delete(organization_id,current_user)
    organization = current_user.organization.find(organization_id)
    ServiceContract.error('Error Deleting Organization') and return unless organization.destroy

    ServiceContract.success(payload: nil)
  end
end
