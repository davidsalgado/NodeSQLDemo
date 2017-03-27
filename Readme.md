DEMO STEPS

Requirements
	Brew
	VSCode
	nodejs
	SQL-CLI
		npm install -g sql-cli
	sequelizer
		if orm demo
	docker
		change docker’s preferences on the top bar, 4gb vm's



Demo steps
	Show the application on nodejs
		Hello World... that only connects
		Something more advanced... using an orm
		Something more advanced... so you don't use jus tthe toothpick
	
	Install SQL Server
		open the aka.ms/sqldev site and show the steps
			Copy the step to docker pull the image
				sudo docker pull microsoft/mssql-server-linux	
			List the docker images... and make a comment about the full stack images we have
			Docker Run the existing image
				docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=EgunOn2017! -p 1433:1433 -d microsoft/mssql-server-linux
				docker ps -all
			Now use the MSSQL CLI to create a sample database that we will use for the demo
				mssql -s localhost -u sa -p EgunOn2017!
				select @@version
				create database 'SampleDB'
	Show how we can connect to the SampleDB
	As we are using vscode, we're going to take advantage of the mssql extension to run some querioes
		I've it installed, I only need to:
			Create a file, set it in sql mode
			and start executing sql commands, first of all, create a connection to the database
			and now I can run queries
			for instance this query to create few more elements
			and see it running
	Let's add more data to the database	
		and see how can we run an app
		[Hello World crud]
		and that's using directly the tedious driver, but we can also go thorugh an orm
		[ormdemo]
	
	And with regards to the toothpick comment, let's see a coupld of interesting features before jumping into where the deployment options

	VSCode (already opened with a nodes sample app and an empty file with language mode SQL)
		> create profile
		> create query
		> execute query.  Cmd shift E
			> Save as JSON
		> (SQL 1) Execute query to create database, 
			> (HELLO WORLD)Show the nodes connection
		> (SQL 2) switch context, create schema…
			> (JSON QUERY)
			> Expla
			> Show the connection
		If time….
		> (SQL 3 CS) make a change on the file (in-memory)
			set statistics time on 
			SELECT SUM(Price) FROM Table_with_5M_rows
			set statistics time off
 		> done

TALKING POINT FOR COLUMNSTORE — don’t use jus the toothpick!