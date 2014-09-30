
/*
 * Main.eq
 * Generated by Eqela Studio 2.0b7.4
 */

public class Main : SEScene
{
	SESprite fg;
	SESprite bg;
	bool move_right=true;
	bool move_left=false;
	bool move_up=false;
	bool move_down=true; 
	int speed=100;
	double rotation=0;
	SESprite text;
	int bounce=0;
	String  my_text;

	

	public void initialize(SEResourceCache rsc) {

		base.initialize(rsc);
		my_text = "BOUNCE = %d".printf().add(Primitive.for_integer(bounce)).to_string();
		bg = add_sprite_for_color(Color.instance("red"),get_scene_width(), get_scene_height());
		bg.move(0,0);
		fg = add_sprite_for_color(Color.instance("green"),get_scene_width()*0.1, get_scene_height()*0.1);
		fg.move(100,100);
			rsc.prepare_font("myfont","arial bold color=white",40);
			text = add_sprite_for_text(my_text,"myfont");
			text.move(100,get_scene_height()-text.get_height()-100);			
	}

	public void update(TimeVal now, double delta) {
		base.update(now, delta);

       	if (move_right) {
			 fg.move(fg.get_x(), fg.get_y() + delta * speed);
			 rotation+=MathConstant.M_PI/10;
			 fg.set_rotation(rotation);
			 if (fg.get_y() + fg.get_height() > get_scene_height()) {
			 move_right=false;
			 move_left=true;
		 	speed=100;
		     bounce++;
		     text.set_text("BOUNCE = %d".printf().add(Primitive.for_integer(bounce)).to_string());	
            }
             speed+=50;
          }
            

           if (move_left) {
			 fg.move(fg.get_x(), fg.get_y() - delta * speed);
			 rotation+=MathConstant.M_PI/10;
			 fg.set_rotation(rotation);	
			 if (fg.get_y()<0) {
			 move_right=true;
		 	move_left=false;
			 speed=100;
			 bounce++;
			 text.set_text("BOUNCE = %d".printf().add(Primitive.for_integer(bounce)).to_string());						
		    }
			 speed+=50;
	       }



			if (move_down) {
			  fg.move(fg.get_x() + delta * speed, fg.get_y());
			  rotation+=MathConstant.M_PI/10;
			  fg.set_rotation(rotation);
			  if (fg.get_x() + fg.get_width() > get_scene_width()) {
			  move_down=false;
			  move_up=true;
		 	 speed=100;
		      bounce++;
		      text.set_text("BOUNCE = %d".printf().add(Primitive.for_integer(bounce)).to_string());
			 }
		      speed+=50;
        	}



		    if (move_up) {
			 fg.move(fg.get_x() - delta * speed, fg.get_y());	
			 rotation+=MathConstant.M_PI/10;
			 fg.set_rotation(rotation);
			 if (fg.get_x()<0) {
			 move_down=true;
			 move_up=false;
			 speed=100;
			 bounce++;
			 text.set_text("BOUNCE = %d".printf().add(Primitive.for_integer(bounce)).to_string());						
		    }
			 speed+=50;
		   }	     
	    }
     
	  
	   public void set_rotation(double angle) {
		 rotation=angle;
	}
	  public double get_rotation() {
		 return(rotation);
    } 
      public void cleanup() {
	     base.cleanup();
	     SESprite.remove(fg);
		 SESprite.remove(bg);
		 SESprite.remove(text);
	}
}