import 'package:flutter/material.dart';
import 'package:flutter_app/database/database.dart';
import 'package:flutter_app/model/model_client.dart';
import 'package:flutter_app/screens/insertupdatedb_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({Key? key}) : super(key: key);

  @override
  _DatabaseScreenState createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database SQFlite"),
        actions: [
          IconButton(
              onPressed: () {
                deleteAllData();
              },
              icon: Icon(Icons.delete))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InsertUpdateDBScreen(
                        edit: false,
                      ))).then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<Client>>(
        future: ClientDatabaseProvider.db.getAllClients(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Client? client = snapshot.data?[index];
                    var a = snapshot.data![index].id! % 2 == 0
                        ? Colors.blue
                        : Colors.green;
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
                        color: a,
                        child: ListTile(
                          title: Text(
                            client?.name ?? "-",
                            style: TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(client?.phone ?? "-",
                              style: TextStyle(fontSize: 16)),
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                            backgroundColor: Colors.blue,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InsertUpdateDBScreen(
                                          client: client,
                                        ))).then((value) {
                              setState(() {});
                            });
                          },
                        ),
                      ),
                      actions: <Widget>[
                        IconSlideAction(
                          caption: 'Archive',
                          color: Colors.blue,
                          icon: Icons.archive,
                          onTap: () => _showSnackBar('Archive', client),
                        ),
                        IconSlideAction(
                          caption: 'Share',
                          color: Colors.indigo,
                          icon: Icons.share,
                          onTap: () => _showSnackBar('Share', client),
                        ),
                      ],
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'More',
                          color: Colors.black45,
                          icon: Icons.more_horiz,
                          onTap: () => _showSnackBar('More', client),
                        ),
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () => _showSnackBar('Delete', client),
                        ),
                      ],
                    );
                    //  Dismissible(
                    //     key: UniqueKey(),
                    //     secondaryBackground: ,
                    //     background: Container(
                    //       color: Colors.red,
                    //       child: Icon(Icons.close),
                    //     ),
                    //     onDismissed: (value) {
                    //       ClientDatabaseProvider.db
                    //           .deleteClientWithId(client?.id);
                    //     },
                    //     child: ListTile(
                    //       title: Text(
                    //         client?.name ?? "-",
                    //         style: TextStyle(fontSize: 20),
                    //       ),
                    //       subtitle: Text(client?.phone ?? "-",
                    //           style: TextStyle(fontSize: 16)),
                    //       leading: CircleAvatar(
                    //         child: Icon(Icons.person),
                    //         backgroundColor: Colors.blue,
                    //       ),
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) =>
                    //                     InsertUpdateDBScreen(client: client,))).then((value) {
                    //           setState(() {});
                    //         });
                    //       },
                    //     ));
                  });
            } else {
              return Center(
                child: Text("Tidak ada data"),
              );
            }
          }
          return Container();
        },
      ),
    );
  }

  void deleteAllData() {
    Widget cancel = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("cancel"));
    Widget delete = TextButton(
        onPressed: () {
          setState(() {
            ClientDatabaseProvider.db.deleteAllClient();
            Navigator.pop(context);
          });
        },
        child: Text("yes"));
    AlertDialog alert = AlertDialog(
      title: Text("Hapus Data Client"),
      content: Text("Apakah anda yakin menghapus semua data ? "),
      actions: [cancel, delete],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  _showSnackBar(String s, Client? client) {
    if (s == "Delete") {
      ClientDatabaseProvider.db.deleteClientWithId(client?.id);
      setState(() {});
      Toast.show("anda memilih ${s}" + client!.id.toString(), context);
    } else {
      Toast.show("anda memilih ${s}", context);
    }
  }
}
