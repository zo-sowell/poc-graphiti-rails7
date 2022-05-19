class IssuesController < ApplicationController
  def index
    issues = IssueResource.all(params)
    respond_with(issues)
  end

  def show
    issue = IssueResource.find(params)
    respond_with(issue)
  end

  def create
    issue = IssueResource.build(params)

    if issue.save
      render jsonapi: issue, status: 201
    else
      render jsonapi_errors: issue
    end
  end

  def update
    issue = IssueResource.find(params)

    if issue.update_attributes
      render jsonapi: issue
    else
      render jsonapi_errors: issue
    end
  end

  def destroy
    issue = IssueResource.find(params)

    if issue.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: issue
    end
  end
end
