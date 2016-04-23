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



class SceneEvents_21 extends SceneScript
{
	public var _lives4:Float;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("lives4", "_lives4");
		_lives4 = 3.0;
		
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
				g.drawString("" + "Keys:", 20, 80);
				g.drawString("" + Engine.engine.getGameAttribute("Score4"), 80, 80);
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getActor(1), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getActor(8) == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(8));
					createRecycledActor(getActorType(112), 211, 561, Script.FRONT);
					createRecycledActor(getActorType(116), 209, 530, Script.FRONT);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getActor(1), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getActor(10) == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(10));
					createRecycledActor(getActorType(112), 177, 1200, Script.FRONT);
					createRecycledActor(getActorType(116), 176, 1170, Script.FRONT);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getActor(1), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getActor(5) == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(5));
					createRecycledActor(getActorType(112), 1104, 1936, Script.FRONT);
					createRecycledActor(getActorType(116), 1105, 1905, Script.FRONT);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getActor(1), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getActor(9) == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(9));
					createRecycledActor(getActorType(112), 1232, 1424, Script.FRONT);
					createRecycledActor(getActorType(116), 1232, 1394, Script.FRONT);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorEntersRegionListener(getRegion(0), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(1), a))
			{
				if((Engine.engine.getGameAttribute("Score4") >= 4))
				{
					Engine.engine.setGameAttribute("level", (Engine.engine.getGameAttribute("level") + 1));
					Engine.engine.setGameAttribute("score", (Engine.engine.getGameAttribute("score") + 1000));
					switchScene(GameModel.get().scenes.get(3).getID(), createFadeOut(2, Utils.getColorRGB(0,0,0)), createFadeIn(2, Utils.getColorRGB(0,0,0)));
				}
				else if((Engine.engine.getGameAttribute("Score4") < 3))
				{
					if((Engine.engine.getGameAttribute("lives4") > 0))
					{
						recycleActor(getActor(1));
						switchScene(GameModel.get().scenes.get(21).getID(), null, createCrossfadeTransition(.5));
					}
					else if((Engine.engine.getGameAttribute("lives4") == 0))
					{
						Engine.engine.setGameAttribute("lives", (Engine.engine.getGameAttribute("lives") - 1));
						Engine.engine.setGameAttribute("level", (Engine.engine.getGameAttribute("level") + 1));
						switchScene(GameModel.get().scenes.get(3).getID(), null, createCrossfadeTransition(1));
					}
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