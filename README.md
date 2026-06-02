Here is how to use the data:
```bash
psp config set client_id admin-app
psp auth login
```
Now make sure you are in the infrastructure repository, then you can upload some example data.
```bash
./post-data-setup.sh <path-to-this-repo>/problems
```

Finally you can now start a project, by using the example project.json in this repo
```bash
psp projects create --json <path-to-this-repo>/project.json 
```
