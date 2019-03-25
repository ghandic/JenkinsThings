# JenkinsThings

This Jenkins docker image allows you to run jobs with docker containers, it installs any plugins defined in the plugins.txt and runs on localhost. 

NOTE: This is for testing and development purposes only

### Deployment
If it is the first time spinning up the Jenkins service then check the console for your password.
```bash
docker-compose up
```


Current boilerplates:
- **BadgeMaker** - With a little bit of work you can make many different badges run for different repo's, for example flake8, pytest coverage, documentation coverage.
