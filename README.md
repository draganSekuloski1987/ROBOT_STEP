# Set up Robot and save installed packages
## initial set up
- cd MyProject 
- python3 -m venv .venv
- source .venv/bin/activate
- pip install robotframework
- robot --version
- python3 -m pip freeze > requirements.txt

# for other to use 
- python3 -m venv .venv
- source .venv/bin/activate
- python3 -m pip install -r requirements.txt


## To verify and set the correct interpreter:
- Press Cmd + Shift + P (Mac) or Ctrl + Shift + P (Windows/Linux).
- Type and select → “Python: Select Interpreter”


## Optional: make it automatic interpreter set
- Create (or update) .vscode/settings.json with:
{
  "python.defaultInterpreterPath": ".venv/bin/python",
  "python.terminal.activateEnvironment": true
}

## [Extension] RobotCode - Robot Framework Support 
- This need robotframework-robocop to be installed in the virtual env
- python3 -m pip install robotframework-robocop


## Robot shortcut
- "Option" -> Gives you option to test as debug
- "Constrol + Option" -> Shows you more info for the keyword and atributes
- "Shift + Option + R" - open library documentation on the right

## Running from command line
robot -d output -v BROWSER=firefox -v URL=https://todomvc.com/examples/react/dist/ ./tests/robot_totorial/todos.robot  
robot -t TestName FileLocation
robot -d output tests/robot_udemy_1/log.robot
robot -t "Test 1 Log user" tests/robot_udemy_1/log.robot
robot --inlclude  smoke tests/robot_udemy_1/log.robot
robot --inlclude  sanity tests
robot -d output --include smoke tests/
robot -d output -i smoke tests/
robot -d output -i regression tests/
robot -d output --exclude smoke tests/robot_udemy_1/log.robot


## open report
- open output/log.html
