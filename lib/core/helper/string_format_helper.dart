class StringFormatHelper{

  static String htmlTagLimitNumberOfLines(String? htmlTagString){
    String limitedLine = "";
    if(htmlTagString != null){
      limitedLine = htmlTagString.length > 100 ? "${htmlTagString.substring(0, 90)} ..." : htmlTagString;
    }
    return limitedLine;
  }
}