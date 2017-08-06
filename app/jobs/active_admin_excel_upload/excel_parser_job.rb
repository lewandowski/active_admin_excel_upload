module ActiveAdminExcelUpload

  class ExcelParserJob < ApplicationJob
    queue_as :excels_queue

    before_perform do |job|
      sleep 5
    end
    def perform(klass,file_path,current_admin_user)
      # Do something later
      klass.constantize.send(:process_sheet, file_path, current_admin_user)
      FileUtils.rm(file_path)
    end
  end
end