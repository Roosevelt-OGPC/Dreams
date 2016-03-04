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



class SceneEvents_8 extends SceneScript
{
	public var _ScoreEnemy:Float;
	public var _scorePlayer:Float;
	
	/* ========================= Custom Event ========================= */
	public function _customEvent__scoreEnemy():Void
	{
		createRecycledActor(getActorType(47), 290, 66, Script.MIDDLE);
		getActor(49).applyImpulseInDirection(45, 30);
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent__scorePlayer():Void
	{
		createRecycledActor(getActorType(47), 290, 66, Script.MIDDLE);
		getActor(49).applyImpulseInDirection(135, 30);
	}
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Score-Enemy", "_ScoreEnemy");
		_ScoreEnemy = 0.0;
		nameMap.set("_scorePlayer", "_scorePlayer");
		_scorePlayer = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		getActor(49).applyImpulseInDirection(45, 30);
		
		/* ======================== Specific Actor ======================== */
		addActorEntersRegionListener(getRegion(0), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(49), a))
			{
				_ScoreEnemy = asNumber((_ScoreEnemy + 1));
				propertyChanged("_ScoreEnemy", _ScoreEnemy);
				recycleActor(getActor(49));
				shoutToScene("_customEvent_" + "_scoreEnemy");
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.drawString("" + getActor(49).getY(), 30, 30);
				g.drawString("" + getActor(49).getX(), 50, 50);
			}
		});
		
		/* ======================== Specific Actor ======================== */
		addActorEntersRegionListener(getRegion(1), function(a:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAs(getActor(49), a))
			{
				_scorePlayer = asNumber((_scorePlayer + 1));
				propertyChanged("_scorePlayer", _scorePlayer);
				recycleActor(getActor(49));
				shoutToScene("_customEvent_" + "_scorePlayer");
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}