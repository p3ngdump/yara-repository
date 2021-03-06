rule win_atmosphere_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.atmosphere."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.atmosphere"
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
        $sequence_0 = { 83ec14 56 8b7104 85f6 }
            // n = 4, score = 400
            //   83ec14               | sub                 esp, 0x14
            //   56                   | push                esi
            //   8b7104               | mov                 esi, dword ptr [ecx + 4]
            //   85f6                 | test                esi, esi

        $sequence_1 = { 6a0a 50 8b11 ff12 }
            // n = 4, score = 400
            //   6a0a                 | push                0xa
            //   50                   | push                eax
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   ff12                 | call                dword ptr [edx]

        $sequence_2 = { 8bf9 6a2e e8???????? 8bf0 }
            // n = 4, score = 400
            //   8bf9                 | mov                 edi, ecx
            //   6a2e                 | push                0x2e
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_3 = { 88460e 33c0 894612 894616 89461a 884e1e }
            // n = 6, score = 400
            //   88460e               | mov                 byte ptr [esi + 0xe], al
            //   33c0                 | xor                 eax, eax
            //   894612               | mov                 dword ptr [esi + 0x12], eax
            //   894616               | mov                 dword ptr [esi + 0x16], eax
            //   89461a               | mov                 dword ptr [esi + 0x1a], eax
            //   884e1e               | mov                 byte ptr [esi + 0x1e], cl

        $sequence_4 = { 6a04 50 8b11 ff12 }
            // n = 4, score = 400
            //   6a04                 | push                4
            //   50                   | push                eax
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   ff12                 | call                dword ptr [edx]

        $sequence_5 = { 56 8b74240c 57 8bf9 8b06 8bce 8b1f }
            // n = 7, score = 400
            //   56                   | push                esi
            //   8b74240c             | mov                 esi, dword ptr [esp + 0xc]
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8bce                 | mov                 ecx, esi
            //   8b1f                 | mov                 ebx, dword ptr [edi]

        $sequence_6 = { 57 33db 8bf1 8965f0 }
            // n = 4, score = 400
            //   57                   | push                edi
            //   33db                 | xor                 ebx, ebx
            //   8bf1                 | mov                 esi, ecx
            //   8965f0               | mov                 dword ptr [ebp - 0x10], esp

        $sequence_7 = { 56 8bf1 8b06 ff5074 }
            // n = 4, score = 400
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   ff5074               | call                dword ptr [eax + 0x74]

        $sequence_8 = { 8b74240c 57 8bf9 8b06 8bce 8b1f }
            // n = 6, score = 400
            //   8b74240c             | mov                 esi, dword ptr [esp + 0xc]
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8bce                 | mov                 ecx, esi
            //   8b1f                 | mov                 ebx, dword ptr [edi]

        $sequence_9 = { 8bce 50 ff15???????? 8d4e16 }
            // n = 4, score = 400
            //   8bce                 | mov                 ecx, esi
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d4e16               | lea                 ecx, [esi + 0x16]

    condition:
        7 of them and filesize < 360448
}