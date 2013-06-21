// platforms/unity/JavascriptSample/Assets/NewBehaviourScript.js

#pragma strict

var input : String = "";
var result : String = "Result";

function OnGUI () {
  GUI.Label(Rect(20,102,204,21), result);
  input = GUI.TextField(Rect(20,50,200,30), input);
  if (GUI.Button(Rect(236,43,67,43), "x 2")) {
    var num = parseInt(input);
    result = String.Format("{0} x 2 = {1}", num, num * 2 );
    Debug.Log(String.Format("input: {0}", num));
  }
}