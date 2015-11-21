1. Import two project in Eclipse
2. Create a database name as "laundry_system"
2. Create the table as per SQl /src/main/sql/create.sql
4. Populate dummy data " /src/main/sql/populate.sql
5. Add below line in hornetq\config\stand-alone\non-clustered

<queue name="exampleQueue">
	<entry name="/queue/exampleQueue"/>
</queue>

5. Run HornetQ run batch from \bin
6. Run JMSReceiverApp from eLaundrySystemReciever project
7. Run as server eLaundrySystem

Enjoy!!!!!

Note: There are two role defined in apps:
UserName:Password
admin:admin
user: user


THis small project @Copyright: AKM Qamruzzaman 
