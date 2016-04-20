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



class SceneEvents_10 extends SceneScript
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
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.drawString("" + "Score:", 20, 40);
				g.drawString("" + Engine.engine.getGameAttribute("score"), 90, 40);
				g.drawString("" + "Lives:", 20, 60);
				g.drawString("" + _lives4, 80, 60);
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getActor(1), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getActor(16) == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(16));
					createRecycledActor(getActorType(112), 208, 273, Script.FRONT);
					createRecycledActor(getActorType(23), 209, 242, Script.FRONT);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getActor(1), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getActor(29) == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(29));
					createRecycledActor(getActorType(112), 497, 144, Script.FRONT);
					createRecycledActor(getActorType(114), 497, 112, Script.FRONT);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getLastCreatedActor(), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getLastCreatedActor() == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(30));
					createRecycledActor(getActorType(112), 2289, 272, Script.FRONT);
					createRecycledActor(getActorType(114), 2288, 241, Script.FRONT);
				}
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addCollisionListener(getLastCreatedActor(), function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && (getLastCreatedActor() == event.otherActor))
			{
				if(event.otherFromBottom)
				{
					recycleActor(getActor(31));
					createRecycledActor(getActorType(112), 3281, 144, Script.FRONT);
					createRecycledActor(getActorType(114), 3280, 113, Script.FRONT);
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}