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



class ActorEvents_49 extends ActorScript
{
	public var _AI:Float;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("AI", "_AI");
		_AI = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		_AI = asNumber(1);
		propertyChanged("_AI", _AI);
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((_AI == 1))
				{
					actor.setY(Engine.engine.getGameAttribute("Y of ball"));
				}
				if((_AI == 2))
				{
					actor.setY(Engine.engine.getGameAttribute("Y of ball"));
				}
				if((_AI == 3))
				{
					actor.setY(Engine.engine.getGameAttribute("Y of ball"));
				}
				if((_AI == 4))
				{
					actor.setY(Engine.engine.getGameAttribute("Y of ball"));
				}
				if((_AI == 5))
				{
					actor.setY(Engine.engine.getGameAttribute("Y of ball"));
				}
				if((_AI == 6))
				{
					actor.setY((Engine.engine.getGameAttribute("Y of ball") + 20));
				}
				if((_AI == 7))
				{
					actor.setY((Engine.engine.getGameAttribute("Y of ball") + 30));
				}
				if((_AI == 8))
				{
					actor.setY((Engine.engine.getGameAttribute("Y of ball") - 20));
				}
				if((_AI == 9))
				{
					actor.setY((Engine.engine.getGameAttribute("Y of ball") - 40));
				}
				if((_AI == 10))
				{
					actor.setY((Engine.engine.getGameAttribute("Y of ball") - 30));
				}
			}
		});
		
		/* ========================= Type & Type ========================== */
		addSceneCollisionListener(getActorType(47).ID, getActorType(21).ID, function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				_AI = asNumber(randomInt(Math.floor(1), Math.floor(10)));
				propertyChanged("_AI", _AI);
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}