<?php
/**
 * Barcode.php
 *--------------------------------------------------------------------
 *
 * Holds all type of barcodes
 *
 *--------------------------------------------------------------------
 * Revision History
 * v1.2.3b	30 dec	2005	Jean-Sébastien Goupil	Checksum separated + PHP5.1 compatible
 * v1.2.1	27 jun	2005	Jean-Sébastien Goupil	Font support added
 * V1.00	17 jun	2004	Jean-Sebastien Goupil
 *--------------------------------------------------------------------
 * $Id: BarCode.php,v 1.1 2007/05/17 16:33:05 actsys Exp $
 * PHP5-Revision: 1.8
 *--------------------------------------------------------------------
 * Copyright (C) Jean-Sebastien Goupil
 * http://other.lookstrike.com/barcode/
 */
class BarCode { // ABSTRACT
	var $maxHeight;
	var $color1,$color2;
	var $positionX, $positionY, $res;
	var $textfont;
	var $text;
	var $lastX, $lastY;
	var $error;
	var $checksumValue;
	var $displayChecksum;

	/**
	 * Constructor
	 *
	 * @param int $maxHeight
	 * @param FColor $color1
	 * @param FColor $color2
	 * @param int $res
	 */
	function BarCode($maxHeight, &$color1, &$color2, $res) {
		$this->maxHeight = $maxHeight;
		$this->color1 = $color1;
		$this->color2 = $color2;
		$this->res = $res;
		$this->error = 0;
		$this->positionX = 0;
		$this->positionY = 0;
		$this->checksumValue = false;
		$this->displayChecksum = false;
	}

	/**
	 * Returns the index in $keys (useful for checksum)
	 *
	 * @param mixed $var
	 * @return mixed
	 */
	function findIndex($var) {
		return array_search($var, $this->keys);
	}

	/**
	 * Returns the code of the char (useful for drawing bars)
	 *
	 * @param mixed $var
	 * @return string
	 */
	function findCode($var) {
		return $this->code[$this->findIndex($var)];
	}

	/**
	 * Draws a Bar of $color depending of the resolution
	 *
	 * @param resource $img
	 * @param FColor $color
	 */
	function DrawSingleBar(&$im, &$color) {
		$bar_color = (is_null($color)) ? NULL : $color->allocate($im);
		if (!is_null($bar_color)) {
			for ($i = 0; $i < $this->res; $i++) {
				imageline($im, $this->positionX + $i, $this->positionY, $this->positionX + $i, $this->positionY + $this->maxHeight, $bar_color);
			}
		}
	}

	/**
	 * Writes the Error on the picture
	 *
	 * @param resource $img
	 * @param string $text
	 */
	function DrawError(&$im, $text) {
		$text_color = (is_null($this->color1)) ? NULL : $this->color1->allocate($im);
		// We will redim the image to make it appears correctly
		$x = imagefontwidth(5) * strlen($text);
		// We take the maximum $x
		$x = (imagesx($im) < $x) ? $x : imagesx($im);

		$im2 = imagecreatetruecolor($x, 15 * ($this->error + 1));
		imagefill($im2, $x - 1, 15 * ($this->error + 1) - 1, $this->color2->allocate($im2));
		imagecopy($im2, $im, 0, 0, 0, 0, imagesx($im), imagesy($im));

		imagestring($im2, 5, 0, $this->error * 15, $text, $text_color);
		$im = $im2;

		$this->error++;
		$this->lastX = (imagefontwidth(5) * strlen($text) > $this->lastX) ? imagefontwidth(5) * strlen($text) : $this->lastX;
		$this->lastY = $this->error * 15;
	}

	/**
	 * Moving the pointer right to write a bar
	 */
	function nextX() {
		$this->positionX += $this->res;
	}

	/**
	 * Draws all chars thanks to $code. if $start===1, the line begins by a bar.
	 * if $start===2, the line begins by a space.
	 *
	 * @param resource $im
	 * @param string $code
	 * @param int $start
	 */
	function DrawChar(&$im, $code, $start = 1) {
		$currentColor = ($start === 1) ? $this->color1 : $this->color2;
		$colornumber = $start;
		$c = strlen($code);
		for ($i = 0; $i < $c; $i++) {
			for ($j = 0; $j < intval($code{$i}) + 1; $j++) {
				$this->DrawSingleBar($im, $currentColor);
				$this->nextX();
			}
			if ($colornumber === 1) {
				$currentColor = $this->color2;
				$colornumber = 2;
			} else {
				$currentColor = $this->color1;
				$colornumber = 1;
			}
		}
	}

	/**
	 * Draws the label under the barcode
	 *
	 * @param resource $im
	 */
	function DrawText(&$im) {
		$text_color = (is_null($this->color1)) ? NULL : $this->color1->allocate($im);
		if (is_a($this->textfont, 'Font')) {
			$textfont = $this->textfont; // Clone
			if ($this->displayChecksum === true && ($checksum = $this->processChecksum()) !== false) {
				$textfont->setText($this->text . $checksum);
			}
			$xPosition = ($this->positionX / 2) - ($textfont->getWidth() / 2);
			$yPosition = $this->maxHeight + $this->positionY + $textfont->getHeight() - $textfont->getUnderBaseline() + constant('SIZE_SPACING_FONT');
			$textfont->draw($im, $text_color, $xPosition, $yPosition);
			$this->lastY = $this->maxHeight + $this->positionY + $textfont->getHeight();
		} elseif ($this->textfont !== 0) {
			$text = $this->text;
			if ($this->displayChecksum === true && ($checksum = $this->processChecksum()) !== false) {
				$text .= $checksum;
			}
			$xPosition = ($this->positionX / 2) - (strlen($text) / 2) * imagefontwidth($this->textfont);
			$yPosition = $this->maxHeight + $this->positionY;
			imagestring($im, $this->textfont, $xPosition, $yPosition, $text, $text_color);
			$this->lastY = $this->maxHeight + $this->positionY + imagefontheight($this->textfont);
		}
	}

	/**
	 * Saves the font.
	 *
	 * @param mixed $font Font or int
	 */
	function setFont(&$font) {
		if (is_a($font, 'Font')) {
			$this->textfont = $font; // Clone
			$this->textfont->setText($this->text);
		} else {
			$this->textfont = intval($font);
		}
	}

	/**
	 * Returns the maximal width of a barcode
	 *
	 * We can't know ! it is specific for each barcode !
	 *
	 * @return int
	 */
	function getMaxWidth() { // ABSTRACT
		return 1;
	}

	/**
	 * Returns the maximal height of a barcode
	 *
	 * @return int
	 */
	function getMaxHeight() {
		$textHeight = 0;
		if (is_a($this->textfont, 'Font')) {
			$textfont = $this->textfont; // Clone
			if ($this->displayChecksum === true && ($checksum = $this->processChecksum()) !== false) {
				$textfont->setText($this->text . $checksum);
			}
			$textHeight = $textfont->getHeight() + constant('SIZE_SPACING_FONT');
		} elseif ($this->textfont !== 0) {
			$textHeight = imagefontheight($this->textfont);
		}
		return $this->maxHeight + $textHeight;
	}

	/**
	 * Returns the real text used for drawing the barcode without checksum
	 *
	 * @return string
	 */
	function getText() {
		return $this->text;
	}

	/**
	 * Gets the checksum of a BarCode.
	 * If no checksum is available, return FALSE.
	 *
	 * @return string
	 */
	function getChecksum() {
		return $this->processChecksum();
	}

	/**
	 * Sets if the checksum is displayed with the label or not.
	 * The checksum must be activated in some case to make this variable effective.
	 *
	 * @param boolean $display
	 */
	function setDisplayChecksum($display) {
		$this->displayChecksum = (bool)$display;
	}

	/**
	 * Method that saves FALSE into the checksumValue. This means no checksum
	 * but this method should be overloaded when needed.
	 */
	function calculateChecksum() {
		$this->checksumValue = false;
	}

	/**
	 * Returns FALSE because there is no checksum. This method should be
	 * overloaded to return correctly the checksum in string with checksumValue.
	 *
	 * @return string
	 */
	function processChecksum() {
		return false;
	}
};
?>