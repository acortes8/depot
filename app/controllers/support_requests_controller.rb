class SupportRequestsController < ApplicationController
  def index
    @support_requests = SupportRequest.all
  end

  def create
    support_request = SupportRequest.create! params.expect(support_request: [:response])
    redirect_to support_request
  end

  def update
    support_request = SupportRequest.find(params[:id])
    support_request.update(response: params.require(:support_request)[:response])
    SupportRequestMailer.respond(support_request).deliver_now
    redirect_to support_requests_path
  end
end
