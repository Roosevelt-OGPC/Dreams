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



class Design_68_68_EmphasiseOnMouseOver extends ActorScript
{
	public var _TypeOfEmphasis:String;
	public var _EmphasisTime:Float;
	public var _EmphasisAmount:Float;
	public var _TintingColour:Int;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Type Of Emphasis", "_TypeOfEmphasis");
		_TypeOfEmphasis = "";
		nameMap.set("Emphasis Time", "_EmphasisTime");
		_EmphasisTime = 1.0;
		nameMap.set("Emphasis Amount", "_EmphasisAmount");
		_EmphasisAmount = 50.0;
		nameMap.set("Tinting Colour", "_TintingColour");
		_TintingColour = Utils.getColorRGB(255,0,0);
		
	}
	
	override public function init()
	{
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				if((_TypeOfEmphasis == "Fade"))
				{
					actor.fadeTo((100 - _EmphasisAmount) / 100, _EmphasisTime, Linear.easeNone);
				}
				else if((_TypeOfEmphasis == "Grow"))
				{
					actor.growTo((100 + _EmphasisAmount)/100, (100 + _EmphasisAmount)/100, _EmphasisTime, Linear.easeNone);
				}
				else if((_TypeOfEmphasis == "Shrink"))
				{
					actor.growTo((100 - _EmphasisAmount)/100, (100 - _EmphasisAmount)/100, _EmphasisTime, Linear.easeNone);
				}
				else if((_TypeOfEmphasis == "Turn Clockwise"))
				{
					actor.setAngle(Utils.RAD * ((360 * (_EmphasisAmount / 100))));
				}
				else if((_TypeOfEmphasis == "Turn Anti-Clockwise"))
				{
					actor.setAngle(Utils.RAD * (-((360 * (_EmphasisAmount / 100)))));
				}
				else if((_TypeOfEmphasis == "Brighten"))
				{
					actor.setFilter([createBrightnessFilter(_EmphasisAmount)]);
				}
				else if((_TypeOfEmphasis == "Darken"))
				{
					actor.setFilter([createBrightnessFilter(-(_EmphasisAmount))]);
				}
				else if((_TypeOfEmphasis == "Tint"))
				{
					actor.setFilter([createTintFilter(_TintingColour, _EmphasisAmount/100)]);
				}
				else if((_TypeOfEmphasis == "Grayscale"))
				{
					actor.setFilter([createGrayscaleFilter()]);
				}
				else if((_TypeOfEmphasis == "Negative"))
				{
					actor.setFilter([createNegativeFilter()]);
				}
				else if((_TypeOfEmphasis == "Sepia"))
				{
					actor.setFilter([createSepiaFilter()]);
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				if((_TypeOfEmphasis == "Fade"))
				{
					actor.fadeTo(100 / 100, _EmphasisTime, Linear.easeNone);
				}
				else if((_TypeOfEmphasis == "Grow"))
				{
					actor.growTo(100/100, 100/100, _EmphasisTime, Linear.easeNone);
				}
				else if((_TypeOfEmphasis == "Shrink"))
				{
					actor.growTo(100/100, 100/100, _EmphasisTime, Linear.easeNone);
				}
				else if((_TypeOfEmphasis == "Turn Clockwise"))
				{
					actor.setAngle(Utils.RAD * (0));
				}
				else if((_TypeOfEmphasis == "Turn Anti-Clockwise"))
				{
					actor.setAngle(Utils.RAD * (0));
				}
				else if((_TypeOfEmphasis == "Brighten"))
				{
					actor.clearFilters();
				}
				else if((_TypeOfEmphasis == "Darken"))
				{
					actor.clearFilters();
				}
				else if((_TypeOfEmphasis == "Tint"))
				{
					actor.clearFilters();
				}
				else if((_TypeOfEmphasis == "Grayscale"))
				{
					actor.clearFilters();
				}
				else if((_TypeOfEmphasis == "Negative"))
				{
					actor.clearFilters();
				}
				else if((_TypeOfEmphasis == "Sepia"))
				{
					actor.clearFilters();
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}