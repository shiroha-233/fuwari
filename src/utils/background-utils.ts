/**
 * 背景图片工具函数
 */

// 背景图片列表 - 您可以在这里添加更多图片
const BACKGROUND_IMAGES = [
  '/backgrounds/1.png',
  '/backgrounds/3.png',
  '/backgrounds/5.png',
];

/**
 * 获取随机背景图片
 */
export function getRandomBackground(): string {
  const randomIndex = Math.floor(Math.random() * BACKGROUND_IMAGES.length);
  return BACKGROUND_IMAGES[randomIndex];
}

/**
 * 获取所有背景图片
 */
export function getAllBackgrounds(): string[] {
  return [...BACKGROUND_IMAGES];
}

/**
 * 设置背景图片到本地存储
 */
export function setStoredBackground(imagePath: string): void {
  if (typeof localStorage !== 'undefined') {
    localStorage.setItem('background-image', imagePath);
  }
}

/**
 * 从本地存储获取背景图片
 */
export function getStoredBackground(): string | null {
  if (typeof localStorage !== 'undefined') {
    return localStorage.getItem('background-image');
  }
  return null;
}

/**
 * 清除存储的背景图片
 */
export function clearStoredBackground(): void {
  if (typeof localStorage !== 'undefined') {
    localStorage.removeItem('background-image');
  }
}

/**
 * 应用背景图片到页面
 */
export function applyBackground(imagePath: string): void {
  const backgroundElement = document.getElementById('background-image');
  if (backgroundElement) {
    (backgroundElement as HTMLElement).style.backgroundImage = `url('${imagePath}')`;
  }
}

/**
 * 移除背景图片
 */
export function removeBackground(): void {
  const backgroundElement = document.getElementById('background-image');
  if (backgroundElement) {
    (backgroundElement as HTMLElement).style.backgroundImage = '';
  }
}