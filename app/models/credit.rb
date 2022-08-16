class Credit < ApplicationRecord
    after_create_commit { broadcast_append_to "credits" }
    after_update_commit { broadcast_replace_to "credits" }
    after_destroy_commit { broadcast_remove_to "credits" }
end
