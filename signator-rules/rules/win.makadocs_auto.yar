rule win_makadocs_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.makadocs."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.makadocs"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 8906 c644243404 8b44241c 51 83c0f0 8964242c 8bf4 }
            // n = 7, score = 100
            //   8906                 | mov                 dword ptr [esi], eax
            //   c644243404           | mov                 byte ptr [esp + 0x34], 4
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   51                   | push                ecx
            //   83c0f0               | add                 eax, -0x10
            //   8964242c             | mov                 dword ptr [esp + 0x2c], esp
            //   8bf4                 | mov                 esi, esp

        $sequence_1 = { c744241800000000 68???????? 33ff 8bc3 c70600000000 }
            // n = 5, score = 100
            //   c744241800000000     | mov                 dword ptr [esp + 0x18], 0
            //   68????????           |                     
            //   33ff                 | xor                 edi, edi
            //   8bc3                 | mov                 eax, ebx
            //   c70600000000         | mov                 dword ptr [esi], 0

        $sequence_2 = { 8dbd54ffffff e8???????? 83c404 8d9d44ffffff c645fc08 e8???????? }
            // n = 6, score = 100
            //   8dbd54ffffff         | lea                 edi, [ebp - 0xac]
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8d9d44ffffff         | lea                 ebx, [ebp - 0xbc]
            //   c645fc08             | mov                 byte ptr [ebp - 4], 8
            //   e8????????           |                     

        $sequence_3 = { e8???????? 8d542420 52 8bce c68424a800000045 e8???????? 83c404 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8d542420             | lea                 edx, [esp + 0x20]
            //   52                   | push                edx
            //   8bce                 | mov                 ecx, esi
            //   c68424a800000045     | mov                 byte ptr [esp + 0xa8], 0x45
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_4 = { c644243014 e8???????? c644243001 8b442420 83c0f0 8d500c 83c9ff }
            // n = 7, score = 100
            //   c644243014           | mov                 byte ptr [esp + 0x30], 0x14
            //   e8????????           |                     
            //   c644243001           | mov                 byte ptr [esp + 0x30], 1
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   83c0f0               | add                 eax, -0x10
            //   8d500c               | lea                 edx, [eax + 0xc]
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_5 = { 5b 5d c21000 8b442414 8b00 3b48f4 7d40 }
            // n = 7, score = 100
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c21000               | ret                 0x10
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   3b48f4               | cmp                 ecx, dword ptr [eax - 0xc]
            //   7d40                 | jge                 0x42

        $sequence_6 = { 85c0 8d4c2444 0f9444241b 885c2468 e8???????? 807c241b00 0f845c010000 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   8d4c2444             | lea                 ecx, [esp + 0x44]
            //   0f9444241b           | sete                byte ptr [esp + 0x1b]
            //   885c2468             | mov                 byte ptr [esp + 0x68], bl
            //   e8????????           |                     
            //   807c241b00           | cmp                 byte ptr [esp + 0x1b], 0
            //   0f845c010000         | je                  0x162

        $sequence_7 = { c744242800000000 8b44241c 8b78f4 6a00 57 50 6a00 }
            // n = 7, score = 100
            //   c744242800000000     | mov                 dword ptr [esp + 0x28], 0
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   8b78f4               | mov                 edi, dword ptr [eax - 0xc]
            //   6a00                 | push                0
            //   57                   | push                edi
            //   50                   | push                eax
            //   6a00                 | push                0

        $sequence_8 = { 3bc5 740e 50 e8???????? 8bd8 }
            // n = 5, score = 100
            //   3bc5                 | cmp                 eax, ebp
            //   740e                 | je                  0x10
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax

        $sequence_9 = { ffd0 8d4c2420 68???????? 51 e8???????? }
            // n = 5, score = 100
            //   ffd0                 | call                eax
            //   8d4c2420             | lea                 ecx, [esp + 0x20]
            //   68????????           |                     
            //   51                   | push                ecx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 344064
}