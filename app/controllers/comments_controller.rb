class CommentsController < ApplicationController

  before_filter :get_ticket

  def index
    @comments = @ticket.comments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  def show
    @comment = @ticket.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def new
    @comment = @ticket.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def edit
    @comment = @ticket.comments.find(params[:id])
  end

  def create
    @comment = @ticket.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to([@ticket, @comment]) }
        format.xml  { render :xml => @comment, :status => :created, :location => [@ticket, @comment] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @comment = @ticket.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to([@ticket, @comment]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @ticket.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(ticket_comments_path(@ticket)) }
      format.xml  { head :ok }
    end
  end

  private

  def get_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
