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



class ActorEvents_0 extends ActorScript
{
	public var _Jump:Bool;
	public var _Left:String;
	public var _Right:String;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Jump?", "_Jump");
		_Jump = false;
		nameMap.set("Left", "_Left");
		nameMap.set("Right", "_Right");
		
	}
	
	override public function init()
	{
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				/* make sure actor doesn't leave screen */
				if((actor.getScreenX() < 0))
				{
					actor.setX(1);
				}
				else if((actor.getScreenX() > (getScreenWidth() - (actor.getWidth()))))
				{
					actor.setX(((getScreenWidth() - (actor.getWidth())) - 1));
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				/* walk left */
				if(isKeyDown("left"))
				{
					Engine.engine.setGameAttribute("left", true);
					Engine.engine.setGameAttribute("right", false);
					actor.setXVelocity(-20);
					if(isKeyDown("shift"))
					{
						actor.setXVelocity(-30);
					}
				}
				/* walk right */
				else if(isKeyDown("right"))
				{
					Engine.engine.setGameAttribute("right", true);
					Engine.engine.setGameAttribute("left", false);
					actor.setXVelocity(20);
					if(isKeyDown("shift"))
					{
						actor.setXVelocity(30);
					}
				}
				else
				{
					actor.setXVelocity(0);
					Engine.engine.setGameAttribute("left", false);
					Engine.engine.setGameAttribute("right", false);
				}
				/* jump */
				if(isKeyPressed("Spacebar"))
				{
					if((_Jump == true))
					{
						_Jump = false;
						propertyChanged("_Jump", _Jump);
						actor.applyImpulseInDirection(270, 38);
					}
				}
				_Jump = false;
				propertyChanged("_Jump", _Jump);
			}
		});
		
		/* ======================= Member of Group ======================== */
		addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAsAny(getActorGroup(1),event.otherActor.getType(),event.otherActor.getGroup()))
			{
				/* jump */
				if(!(event.thisFromTop))
				{
					_Jump = true;
					propertyChanged("_Jump", _Jump);
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}