package com.javatpoint.animation;

import android.os.Bundle;
import android.app.Activity;
import android.graphics.drawable.AnimationDrawable;
import android.widget.ImageView;

public class MainActivity extends Activity {

	ImageView anm;
	 public void onCreate(Bundle savedInstanceState) {
	        super.onCreate(savedInstanceState);
	        setContentView(R.layout.logo);
	        anm = (ImageView)findViewById(R.id.anm);
	        
	        anm.setBackgroundResource(R.drawable.animation);		// the frame-by-frame animation defined as a xml file within the drawable folder
	        
	        /*
	         * NOTE: It's not possible to start the animation during the onCreate.
	         */
	    }
	 public void onWindowFocusChanged (boolean hasFocus) {
			super.onWindowFocusChanged(hasFocus);
			AnimationDrawable frameAnimation = 
				(AnimationDrawable) anm.getBackground();
			if(hasFocus) {
				frameAnimation.start();
			} else {
				frameAnimation.stop();
			}
		}

}
