import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewPage extends StatefulWidget {
  final String linkPdf;
  const PdfViewPage({
    Key? key,
    required this.linkPdf,
  }) : super(key: key);

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    PdfViewerController controller = PdfViewerController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 60,
            child: SfPdfViewer.network(
              widget.linkPdf,
              key: _pdfViewerKey,
              pageLayoutMode: PdfPageLayoutMode.single,
              enableDoubleTapZooming: true,
              enableTextSelection: true,
              pageSpacing: 0,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.blueGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_circle_left,
                    size: 40,
                  ),
                  onTap: () {
                    controller.previousPage();
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_circle_right,
                    size: 40,
                  ),
                  onTap: () {
                    controller.nextPage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
