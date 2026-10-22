import 'package:nas_home/domain/entities/hardware_info.dart';
import 'package:nas_home/domain/entities/nas_service.dart';

const testHardwareInfo = HardwareInfo(
  hostname: 'nas',
  cpuUsage: 10,
  ramUsed: 2,
  ramTotal: 16,
  uptime: '5 days',
  temperature: 45,
  downloadSpeed: 1,
  uploadSpeed: 1,
  ssdUsed: 10,
  ssdTotal: 100,
  hddUsed: 20,
  hddTotal: 200,
);

const testServices = [
  NasService(name: 'Jellyfin', port: '8096', description: 'Media Server'),
  NasService(name: 'Nginx Proxy Manager', port: '81', description: 'Proxy'),
  NasService(
    name: 'Nextcloud',
    port: '',
    description: 'Cloud',
    isDeployed: false,
  ),
];

NasService serviceWithUpdate({
  String name = 'Jellyfin',
  String? localVersion = 'v1.0.0',
  String localDigest = 'sha256:oldlocaldigest0001',
  String remoteDigest = 'sha256:newremotedigest01',
  String imageTag = 'latest',
  String? remoteLastUpdated,
  String containerName = 'jellyfin',
}) {
  return NasService(
    name: name,
    port: '8096',
    description: 'Media Server',
    updateAvailable: true,
    containerName: containerName,
    localDigest: localDigest,
    remoteDigest: remoteDigest,
    localVersion: localVersion,
    remoteLastUpdated: remoteLastUpdated,
    imageTag: imageTag,
  );
}
