module PoeetsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_poeets_path
    elsif action_name == 'edit'
      poeet_path
    end
  end
end
