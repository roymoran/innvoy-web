class RepairSubmissionsController < ApplicationController
	def show
		@repairSubmission = RepairSubmission.all
	end

	def new
		@repairSubmission = RepairSubmission.new
	end

	def create
		@repairSubmission = RepairSubmission.new(repairSubmission_params)  
		@repairSubmission.save 
		redirect_to :back

		@repairSubmission = RepairSubmission.new(repairSubmission_params)  
		if @repairSubmission.save 
		SubscriberMailer.repair_submission_email(@repairSubmission).deliver_now
		redirect_to '/anautomy/thankyouforsubmitting#next' 
		else
			render 'new'
		end

	end

	private

    def repairSubmission_params
      params.require(:repair_submission).permit(:name, :zip, :email, :vehicleYear, :vehicleMake, :vehicleModel, :vehicleTrim, :vehicleMileage, :repairDescription, :partsCost, :laborCost, :shopName, :shopCityState, :review)
    end

end
