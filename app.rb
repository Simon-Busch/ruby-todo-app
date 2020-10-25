require_relative 'router'
require_relative 'controller'
require_relative 'repository'
# require_relative 'view'


csv_file   = File.join(__dir__, 'tasks.csv')
# view = View.new
repository = Repository.new(csv_file)
controller = Controller.new(repository) # working

router = Router.new(controller) # working
router.run