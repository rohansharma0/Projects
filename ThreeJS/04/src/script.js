import "./style.css";

import * as THREE from "three";
import gsap from "gsap";
import * as dat from "dat.gui";

import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";

//Debug
// const gui = new dat.GUI();

//Textures
const loadingManager = new THREE.LoadingManager();

loadingManager.onStart = () => {
	//onStart
};
loadingManager.onProgress = () => {
	//onProgress
};
loadingManager.onLoad = () => {
	//onLoad
};
loadingManager.onError = () => {
	//onErreor
};

const textureLoader = new THREE.TextureLoader(loadingManager);

const cubeTextureLoader = new THREE.CubeTextureLoader();

const envMapTexture = cubeTextureLoader.load([
	"/environmentMaps/3/px.jpg",
	"/environmentMaps/3/nx.jpg",
	"/environmentMaps/3/py.jpg",
	"/environmentMaps/3/ny.jpg",
	"/environmentMaps/3/pz.jpg",
	"/environmentMaps/3/nz.jpg",
]);

//wall texture
const wallBaseColor = textureLoader.load("/textures/wall/basecolor.jpg");
const wallHeight = textureLoader.load("/textures/wall/height.png");
const wallNormal = textureLoader.load("/textures/wall/normal.jpg");
const wallRoughness = textureLoader.load("/textures/wall/roughness.jpg");
const wallAmbientOcclusion = textureLoader.load(
	"/textures/wall/ambientOcclusion.jpg",
);

// tube texture
const tubeBaseColor = textureLoader.load(
	"/textures/tube/Plastic_Tubes_001_basecolor.jpg",
);
const tubeHeight = textureLoader.load(
	"/textures/tube/Plastic_Tubes_001_height.png",
);
const tubeNormal = textureLoader.load(
	"/textures/tube/Plastic_Tubes_001_normal.jpg",
);
const tubeRoughness = textureLoader.load(
	"/textures/tube/Plastic_Tubes_001_roughness.jpg",
);
const tubeAmbientOcclusion = textureLoader.load(
	"/textures/tube/Plastic_Tubes_001_ambientOcclusion.jpg",
);
// ball texture
const ballBaseColor = textureLoader.load(
	"/textures/ball/Marble_Red_004_basecolor.jpg",
);
const ballHeight = textureLoader.load(
	"/textures/ball/Marble_Red_004_height.png",
);
const ballNormal = textureLoader.load(
	"/textures/ball/Marble_Red_004_normal.jpg",
);
const ballRoughness = textureLoader.load(
	"/textures/ball/Marble_Red_004_roughness.jpg",
);
const ballAmbientOcclusion = textureLoader.load(
	"/textures/ball/Marble_Red_004_ambientOcclusion.jpg",
);

// Canvas
const canvas = document.querySelector("#canvas");

// Sizes
const sizes = {
	width: window.innerWidth,
	height: window.innerHeight,
};

window.addEventListener("resize", () => {
	//Update sizes
	sizes.width = window.innerWidth;
	sizes.height = window.innerHeight;

	//Update Camera
	camera.aspect = sizes.width / sizes.height;
	camera.updateProjectionMatrix();

	//Update renderer
	renderer.setSize(sizes.width, sizes.height);
	renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
});

// window.addEventListener("dblclick", () => {
// 	const fullscreenElement =
// 		document.fullscreenElement || document.webkitFullScreenElement;

// 	if (!fullscreenElement) {
// 		if (canvas.requestFullscreen) {
// 			canvas.requestFullscreen();
// 		} else if (canvas.webkitRequestFullscreen) {
// 			canvas.webkitFullScreenElement();
// 		}
// 	} else {
// 		if (document.exitFullscreen) {
// 			document.exitFullscreen();
// 		} else if (document.webkitExitFullscreen) {
// 			document.webkitExitFullscreen();
// 		}
// 	}
// });

// Cursor
const cursor = {
	x: 0,
	y: 0,
};

window.addEventListener("mousemove", (e) => {
	cursor.x = e.clientX / sizes.width - 0.5;
	cursor.y = -(e.clientY / sizes.height - 0.5);
});

//scene
const scene = new THREE.Scene();

//Lights

const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
scene.add(ambientLight);

const pointLight = new THREE.PointLight(0xffffff, 0.5);
pointLight.position.set(2, 3, 4);
scene.add(pointLight);

//object

const sphere = new THREE.Mesh(
	new THREE.SphereBufferGeometry(0.5, 64, 64),
	new THREE.MeshStandardMaterial({
		// map: ballBaseColor,
		// normalMap: ballNormal,
		// roughnessMap: ballRoughness,
		// displacementMap: ballHeight,
		// aoMap: ballAmbientOcclusion,
		// displacementScale: 0.15,
		metalness: 0.7,
		roughness: 0.2,
		envMap: envMapTexture,
	}),
);

sphere.geometry.setAttribute(
	"uv2",
	new THREE.BufferAttribute(sphere.geometry.attributes.uv.array, 2),
);

sphere.position.x = -1.5;

const plane = new THREE.Mesh(
	new THREE.PlaneBufferGeometry(1, 1, 100, 100),
	new THREE.MeshStandardMaterial({
		// map: wallBaseColor,
		// side: THREE.DoubleSide,
		// normalMap: wallNormal,
		// roughnessMap: wallRoughness,
		// displacementMap: wallHeight,
		// aoMap: wallAmbientOcclusion,
		// displacementScale: 0.05,
		metalness: 0.7,
		roughness: 0.2,
		envMap: envMapTexture,
	}),
);

plane.geometry.setAttribute(
	"uv2",
	new THREE.BufferAttribute(plane.geometry.attributes.uv.array, 2),
);

const torus = new THREE.Mesh(
	new THREE.TorusBufferGeometry(0.3, 0.2, 64, 128),
	new THREE.MeshStandardMaterial({
		// map: tubeBaseColor,
		// normalMap: tubeNormal,
		// roughnessMap: tubeRoughness,
		// displacementMap: tubeHeight,
		// aoMap: tubeAmbientOcclusion,
		// displacementScale: 0.1,
		metalness: 0.7,
		roughness: 0.2,
		envMap: envMapTexture,
	}),
);

torus.geometry.setAttribute(
	"uv2",
	new THREE.BufferAttribute(torus.geometry.attributes.uv.array, 2),
);

torus.position.x = 1.5;

// scene.add(sphere);
// scene.add(plane);
// scene.add(torus);

// gui.add(sphere.material, "aoMapIntensity", 0, 10, 0.001);
// gui.add(plane.material, "aoMapIntensity", 0, 10, 0.001);
// gui.add(torus.material, "aoMapIntensity", 0, 10, 0.001);

// gui.add(sphere.material, "metalness", 0, 1, 0.0001);
// gui.add(plane.material, "metalness", 0, 1, 0.0001);
// gui.add(torus.material, "metalness", 0, 1, 0.0001);

// gui.add(sphere.material, "roughness", 0, 1, 0.0001);
// gui.add(plane.material, "roughness", 0, 1, 0.0001);
// gui.add(torus.material, "roughness", 0, 1, 0.0001);

// gui.add(sphere.material, "displacementScale", 0, 1, 0.0001);
// gui.add(plane.material, "displacementScale", 0, 1, 0.0001);
// gui.add(torus.material, "displacementScale", 0, 1, 0.0001);

//font
const fontLoader = new THREE.FontLoader();

fontLoader.load("/fonts/helvetiker_regular.typeface.json", (font) => {
	const textGeometry = new THREE.TextBufferGeometry("Rohan Sharma", {
		font: font,
		size: 0.5,
		height: 0.2,
		curveSegments: 5,
		bevelEnabled: true,
		bevelThickness: 0.03,
		bevelSize: 0.02,
		bevelOffset: 0,
		bevelSegments: 4,
	});
	textGeometry.center();

	const textMaterial = new THREE.MeshNormalMaterial();
	// textMaterial.wireframe = true;
	const text = new THREE.Mesh(textGeometry, textMaterial);

	scene.add(text);

	for (let i = 0; i < 100; i++) {
		const donut = new THREE.Mesh(
			new THREE.TorusBufferGeometry(0.3, 0.2, 20, 45),
			textMaterial,
		);

		donut.position.x = (Math.random() - 0.5) * 10;
		donut.position.y = (Math.random() - 0.5) * 10;
		donut.position.z = (Math.random() - 0.5) * 10;

		donut.rotation.x = Math.random() * Math.PI;
		donut.rotation.y = Math.random() * Math.PI;

		const scale = Math.random();
		donut.scale.set(scale, scale, scale);

		scene.add(donut);
	}

	for (let i = 0; i < 100; i++) {
		const donut = new THREE.Mesh(
			new THREE.BoxBufferGeometry(0.5, 0.5, 0.5),
			textMaterial,
		);

		donut.position.x = (Math.random() - 0.5) * 10;
		donut.position.y = (Math.random() - 0.5) * 10;
		donut.position.z = (Math.random() - 0.5) * 10;

		donut.rotation.x = Math.random() * Math.PI;
		donut.rotation.y = Math.random() * Math.PI;

		const scale = Math.random();
		donut.scale.set(scale, scale, scale);

		scene.add(donut);
	}
});

//Axes Helper
// const axesHelper = new THREE.AxesHelper();
// scene.add(axesHelper);

//camera
const camera = new THREE.PerspectiveCamera(
	75,
	sizes.width / sizes.height,
	0.1,
	100,
);
camera.position.z = 3;
scene.add(camera);

const controls = new OrbitControls(camera, canvas);
controls.enablePan = false;
controls.enableDamping = true;

const renderer = new THREE.WebGLRenderer({
	canvas: canvas,
});

renderer.setSize(sizes.width, sizes.height);
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

//Clock
const clock = new THREE.Clock();

//Animations
const tick = () => {
	const elapsedTime = clock.getElapsedTime();

	//Update object

	sphere.rotation.y = 0.1 * elapsedTime;
	plane.rotation.y = 0.1 * elapsedTime;
	torus.rotation.y = 0.1 * elapsedTime;

	sphere.rotation.x = 0.15 * elapsedTime;
	plane.rotation.x = 0.15 * elapsedTime;
	torus.rotation.x = 0.15 * elapsedTime;

	// box2.position.x = Math.sin(elapsedTime);
	// box2.position.y = Math.cos(elapsedTime);

	// box3.position.y = Math.sin(elapsedTime);
	// box3.position.x = Math.cos(elapsedTime);

	// camera.lookAt(box1.position);

	// camera.position.x = cursor.x * 5;
	// camera.position.y = cursor.y * 5;

	// camera.position.x = Math.sin(cursor.x * Math.PI * 2) * 2;
	// camera.position.z = Math.cos(cursor.x * Math.PI * 2) * 2;
	// camera.position.y = cursor.y * 3;

	// camera.lookAt(box.position);

	controls.update();

	renderer.render(scene, camera);

	window.requestAnimationFrame(tick);
};

tick();
