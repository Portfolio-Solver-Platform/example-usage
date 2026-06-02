Here is how to use the data:
```bash
psp config set client_id admin-app
psp auth login
```
Now make sure you are in the infrastructure repository, then you can upload some example data.
```bash
./post-data-setup.sh <path-to-this-repo>/problems
```

You can now start a project by using the example project.json in this repo
```bash
psp projects create --json <path-to-this-repo>/project.json 
```

Finally you can retrieve the result by finding the project id given to you and use it in this command:
```bash
psp projects results -w <id> # -w makes it keep trying to retrieve it until it is finished
```

Note: if the platform was just set up, you migth see "Error 503: Project status temporarily unavailable", which is just that some services are still being downloaded. (this is of course not optimal)
