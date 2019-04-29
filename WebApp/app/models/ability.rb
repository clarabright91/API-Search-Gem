class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new

    if user.role == 'admin_users'
      can :manage, :all
    elsif user.role == "marketing_manager"
      can :read, :all
      cannot :manage, [AdminUser, City, FdicInstitution, CmsPage, FactualMortgageCompany, FdicInstitution, FreddieMacCache, FreddieMacLoanOrigination, LoanOfficer, NewsArticle, NewsSearchHistory]
      cannot :manage, User
      can :manage, Expert
      cannot :destroy, Expert
    end
  end
end