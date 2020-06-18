module PoeetsHelper
  # def choose_new_or_edit
  #   if action_name == 'new' || action_name == 'create' || action_name == 'confirm'
  #     confirm_poeets_path
  #   elsif action_name == 'edit'
  #     confirm_poeet_path
  #   end
  # end
  def choose_new_or_edit
    @poeet.id ? confirm_poeet_path : confirm_poeets_path
  end

  def confirm_new_or_edit
    logger.debug("☆☆confirm_new_or_edit")
    logger.debug(@poeet.id)
    if @poeet.id?
      poeet_path
    else
      poeets_path
    end
  end

  def confirm_form_method
    @poeet.id ? 'patch' : 'post'
  end
end
