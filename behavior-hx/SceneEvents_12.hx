package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_12 extends SceneScript
{
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		
	}
	
	override public function init()
	{
		
		/* ======================== Specific Actor ======================== */
		addWhenKilledListener(getActor(1), function(list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("birdManLives") > 0))
				{
					reloadCurrentScene(createFadeOut(.5, Utils.getColorRGB(0,0,0)), createFadeIn(.5, Utils.getColorRGB(0,0,0)));
					Engine.engine.setGameAttribute("birdManLives", (Engine.engine.getGameAttribute("birdManLives") - 1));
				}
				else if((Engine.engine.getGameAttribute("birdManLives") == 0))
				{
					Engine.engine.setGameAttribute("level", (Engine.engine.getGameAttribute("level") + 1));
					Engine.engine.setGameAttribute("lives", (Engine.engine.getGameAttribute("lives") - 1));
					switchScene(GameModel.get().scenes.get(3).getID(), null, createCrossfadeTransition(1));
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorPositionListener(getActor(1), function(enteredScreen:Bool, exitedScreen:Bool, enteredScene:Bool, exitedScene:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && exitedScreen)
			{
				recycleActor(getActor(1));
				reloadCurrentScene(createFadeOut(.5, Utils.getColorRGB(0,0,0)), createFadeIn(.5, Utils.getColorRGB(0,0,0)));
				Engine.engine.setGameAttribute("birdManLives", (Engine.engine.getGameAttribute("birdManLives") - 1));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorPositionListener(getActor(1), function(enteredScreen:Bool, exitedScreen:Bool, enteredScene:Bool, exitedScene:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && exitedScreen)
			{
				recycleActor(getActor(1));
				reloadCurrentScene(createFadeOut(.5, Utils.getColorRGB(0,0,0)), createFadeIn(.5, Utils.getColorRGB(0,0,0)));
				Engine.engine.setGameAttribute("birdManLives", (Engine.engine.getGameAttribute("birdManLives") - 1));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorPositionListener(getActor(1), function(enteredScreen:Bool, exitedScreen:Bool, enteredScene:Bool, exitedScene:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && exitedScreen)
			{
				if((Engine.engine.getGameAttribute("birdManLives") > 0))
				{
					recycleActor(getActor(1));
					switchScene(GameModel.get().scenes.get(16).getID(), null, createCrossfadeTransition(.5));
				}
				else if((Engine.engine.getGameAttribute("birdManLives") == 0))
				{
					Engine.engine.setGameAttribute("lives", (Engine.engine.getGameAttribute("lives") - 1));
					Engine.engine.setGameAttribute("level", (Engine.engine.getGameAttribute("level") + 1));
					switchScene(GameModel.get().scenes.get(3).getID(), null, createCrossfadeTransition(1));
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(12), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 1000));
				Engine.engine.setGameAttribute("level", (Engine.engine.getGameAttribute("level") + 1));
				switchScene(GameModel.get().scenes.get(3).getID(), null, createCrossfadeTransition(.5));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(3), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(0), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(1), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(2), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(4), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.drawString("" + Engine.engine.getGameAttribute("score"), 50, 50);
				g.drawString("" + Engine.engine.getGameAttribute("birdManLives"), 50, 100);
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(5), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(6), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(7), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(8), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(9), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(10), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorExitsRegionListener(getRegion(11), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 100));
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}