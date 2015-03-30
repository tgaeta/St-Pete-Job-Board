class CompaniesController < InheritedResources::Base

  private

    def company_params
      params.require(:company).permit(:name, :email, :password_digest, :url, :logo, :bio)
    end
end

