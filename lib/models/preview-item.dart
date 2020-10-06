class PreviewItem {
  String imageUrl, name, performer, videoUrl;
  int width;

  PreviewItem(
      this.imageUrl, this.name, this.performer, this.width, this.videoUrl);

  PreviewItem.image(String imageUrl, {int width = 100})
      : this(imageUrl, 'Song name', 'Performer', width, null);

  PreviewItem.video(String videoUrl)
      : this(null, 'Song name', 'Performer', 200, videoUrl);

  PreviewItem.origin()
      : this('https://miro.medium.com/max/2800/0*xMaFF2hSXpf_kIfG.jpg',
            'Song name', 'Performer', 100, null);
}
