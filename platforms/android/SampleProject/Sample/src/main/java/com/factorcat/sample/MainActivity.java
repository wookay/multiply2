// platforms/android/SampleProject/Sample/src/main/java/com/factorcat/sample/MainActivity.java

package com.factorcat.sample;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.EditText;
import android.widget.Button;
import android.widget.TextView;
import android.view.View;
import android.view.View.OnClickListener;
import android.util.Log;

public class MainActivity extends Activity {
    EditText input;
    Button button;
    TextView result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        input = (EditText) this.findViewById(R.id.input);
        button = (Button) this.findViewById(R.id.button);
        result = (TextView) this.findViewById(R.id.result);
        button.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(final View v) {
                int num = 0;
                try {
                    num = Integer.parseInt(input.getText().toString());
                } catch (NumberFormatException e) {
                }
                result.setText(String.format("%d x 2 = %d", num, num*2));
                Log.i("[log]", "input: " + num);
            }
        });
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
