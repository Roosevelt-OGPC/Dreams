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



class SceneEvents_22 extends SceneScript
{
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		Engine.engine.setGameAttribute("Score4", 0);
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.drawString("" + "Score:", 20, 40);
				g.drawString("" + Engine.engine.getGameAttribute("score"), 90, 40);
				g.drawString("" + "Lives:", 20, 60);
				g.drawString("" + Engine.engine.getGameAttribute("lives4"), 80, 60);
				g.drawString("" + "Keys:   /4", 20, 80);
				g.drawString("" + Engine.engine.getGameAttribute("Score4"), 80, 80);
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getActor(25), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getActor(2) == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(2));
					createRecycledActor(getActorType(112), 112, 528, Script.FRONT);
					createRecycledActor(getActorType(116), 115, 495, Script.FRONT);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getActor(25), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getActor(3) == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(3));
					createRecycledActor(getActorType(112), 112, 1680, Script.FRONT);
					createRecycledActor(getActorType(116), 115, 1646, Script.FRONT);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getActor(25), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getActor(5) == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(5));
					createRecycledActor(getActorType(112), 1648, 1936, Script.FRONT);
					createRecycledActor(getActorType(116), 1651, 1905, Script.FRONT);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getActor(25), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getActor(6) == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(6));
					createRecycledActor(getActorType(112), 1840, 1552, Script.FRONT);
					createRecycledActor(getActorType(116), 1841, 1518, Script.FRONT);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getActor(25), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getActor(1) == event.otherActor))
			{
				if(event.thisFromBottom)
				{
					recycleActor(getActor(25));
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorEntersRegionListener(getRegion(0), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(25), a))
			{
				if((Engine.engine.getGameAttribute("Score4") == 4))
				{
					Engine.engine.setGameAttribute("level", (Engine.engine.getGameAttribute("level") + 1));
					Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 1000));
					switchScene(GameModel.get().scenes.get(3).getID(), createFadeOut(2, Utils.getColorRGB(0,0,0)), createFadeIn(2, Utils.getColorRGB(0,0,0)));
				}
				else
				{
					getActor(25).setX(2069);
					getActor(25).setY(167);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addWhenKilledListener(getActor(1), function(list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("lives4") > 0))
				{
					Engine.engine.setGameAttribute("lives4", (Engine.engine.getGameAttribute("lives4") - 1));
					reloadCurrentScene(createFadeOut(.5, Utils.getColorRGB(0,0,0)), createFadeIn(.5, Utils.getColorRGB(0,0,0)));
				}
				else if((Engine.engine.getGameAttribute("lives4") == 0))
				{
					Engine.engine.setGameAttribute("lives", (Engine.engine.getGameAttribute("lives") - 1));
					Engine.engine.setGameAttribute("level", (Engine.engine.getGameAttribute("level") + 1));
					switchScene(GameModel.get().scenes.get(3).getID(), null, createCrossfadeTransition(1));
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}