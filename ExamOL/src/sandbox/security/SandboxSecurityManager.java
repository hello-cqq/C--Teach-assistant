package sandbox.security;

public class SandboxSecurityManager extends SecurityManager {
	/**
	 * 防止有人非法退出虚拟机
	 */
	@Override
	public void checkExit(int status) {
		throw new RuntimeException("非法操作");
	}

}
