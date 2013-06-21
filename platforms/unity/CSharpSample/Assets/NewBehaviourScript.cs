// platforms/unity/CSharpSample/Assets/NewBehaviourScript.cs

using UnityEngine;
using System.Collections;
using System;

public class NewBehaviourScript : MonoBehaviour {
	
	private string input = "";
	private string result = "Result";
	
	void OnGUI () {
		GUI.Label(new Rect(20,102,204,21), result);
		input = GUI.TextField(new Rect(20,50,200,30), input);
		if (GUI.Button(new Rect(236,43,67,43), "x 2")) {
            int num = 0;
            try {
                num = Convert.ToInt32(input);
            } catch (FormatException) {
            }
            result = String.Format("{0} x 2 = {1}", num, num*2);
			Debug.Log(String.Format("input: {0}", num));
        }
	}

}
