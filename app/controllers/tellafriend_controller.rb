class TellafriendController < ApplicationController

  EMAIL_NAME_REGEX  = '[\w\.%\+\-]+'
  DMOAIN_HEAD_REGEX = '(?:[A-Z0-9\-]+\.)+'
  DOMAIN_TLD_REGEX  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
  EMAIL_REGEX       = /\A#{EMAIL_NAME_REGEX}@#{DMOAIN_HEAD_REGEX}#{DOMAIN_TLD_REGEX}\z/i
  
  def index
    @email_1_class  = 'gross'
    @email_2_class  = 'gross'
    @email_3_class  = 'gross'
    @email_4_class  = 'gross'
    @name_class     = 'gross'
    @ownmail_class  = 'gross'
  end

  def send_to_friends

    @email_1_class  = 'gross'
    @email_2_class  = 'gross'
    @email_3_class  = 'gross'
    @email_4_class  = 'gross'
    @name_class     = 'gross'
    @ownmail_class  = 'gross'
    
    @email_1  = params[:email_1]
    @email_2  = params[:email_2]
    @email_3  = params[:email_3]
    @email_4  = params[:email_4]
    @message  = params[:message]
    @name     = params[:name]
    @ownmail  = params[:ownmail]

    if (@email_1.length > 0 || @email_2.length > 0 || @email_3.length > 0 || @email_4.length > 0)

      wrong_mails_count = 0

      if (@email_1.length > 0 && !(@email_1 =~ EMAIL_REGEX))
        wrong_mails_count   += 1
        @email_1_class      = 'gross_red'
      end

      if (@email_2.length > 0 && !(@email_2 =~ EMAIL_REGEX))
        wrong_mails_count   += 1
        @email_2_class      = 'gross_red'
      end

      if (@email_3.length > 0 && !(@email_3 =~ EMAIL_REGEX))
        wrong_mails_count   += 1
        @email_3_class      = 'gross_red'
      end

      if (@email_4.length > 0 && !(@email_4 =~ EMAIL_REGEX))
        wrong_mails_count   += 1
        @email_4_class      = 'gross_red'
      end

      if (@ownmail.length > 0 && !(@ownmail =~ EMAIL_REGEX))
        wrong_mails_count   += 1
        @ownmail_class      = 'gross_red'
      end

      if (@name.length == 0)
        @name_class = 'gross_red'
      end


      if wrong_mails_count > 0
        
        if wrong_mails_count > 1
          @error_message = 'Die markierten E-Mail-Adressen sind ungültig!'
        else
          @error_message = 'Die markierte E-Mail-Adresse ist ungültig!'
        end

        render :action => 'index'

      elsif @name.length == 0

        @error_message = 'Bitte geben Sie Ihren Namen an!'

        render :action => 'index'
      end

      if (@email_1.length > 0)
        Mailer.deliver_invitation(@email_1, @ownmail, @name, @message)
      end
      
    else
      @email_1_class      = 'gross_red'
      @email_2_class      = 'gross_red'
      @email_3_class      = 'gross_red'
      @email_4_class      = 'gross_red'
      @error_message = 'Bitte geben sie mindestens eine E-Mail ein!'
      render :action => 'index'
    end
  end
end
