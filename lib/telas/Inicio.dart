import 'package:flutter/material.dart';
import 'package:flutter_tube/Api.dart';
import 'package:flutter_tube/model/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';


class Inicio extends StatefulWidget {

  String pesquisa;
  Inicio(this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(String pesquisa){
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa!),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none :
          case ConnectionState.waiting :
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active :
          case ConnectionState.done :
            if(snapshot.hasData){
              return ListView.separated(
                  itemBuilder: (context, index){
                    List<Video> videos = snapshot.data!;
                    Video video = videos[index];
                    return GestureDetector(
                      onTap: (){
                        FlutterYoutube.playYoutubeVideoById(
                            apiKey: YOUTUBE_API_KEY,
                            videoId: video.id,
                          autoPlay: true,
                          fullScreen: true
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(video.imagem!)
                                )
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo!),
                            subtitle: Text(video.canal!),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 2,
                      color: Colors.grey,
                  ),
                  itemCount: snapshot.data!.length
              );
            }else{
              return Center(
                child: Text("Tente novamente ou verifique a sua conexão."),
              );
            }

        }
      },
    );
  }
}
