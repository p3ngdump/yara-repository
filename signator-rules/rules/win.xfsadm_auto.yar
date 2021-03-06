rule win_xfsadm_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.xfsadm."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xfsadm"
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
        $sequence_0 = { ff15???????? ff75e4 8bf0 ff15???????? 0fb60d???????? 33c0 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   0fb60d????????       |                     
            //   33c0                 | xor                 eax, eax

        $sequence_1 = { eb02 33c9 8b450c 0fb684c8b00d4200 c1e804 8be5 5d }
            // n = 7, score = 100
            //   eb02                 | jmp                 4
            //   33c9                 | xor                 ecx, ecx
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   0fb684c8b00d4200     | movzx               eax, byte ptr [eax + ecx*8 + 0x420db0]
            //   c1e804               | shr                 eax, 4
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp

        $sequence_2 = { 897314 894b10 c7430c02010000 83c601 74be 5f 8bc6 }
            // n = 7, score = 100
            //   897314               | mov                 dword ptr [ebx + 0x14], esi
            //   894b10               | mov                 dword ptr [ebx + 0x10], ecx
            //   c7430c02010000       | mov                 dword ptr [ebx + 0xc], 0x102
            //   83c601               | add                 esi, 1
            //   74be                 | je                  0xffffffc0
            //   5f                   | pop                 edi
            //   8bc6                 | mov                 eax, esi

        $sequence_3 = { 897824 8d8528feffff 897e28 894708 }
            // n = 4, score = 100
            //   897824               | mov                 dword ptr [eax + 0x24], edi
            //   8d8528feffff         | lea                 eax, [ebp - 0x1d8]
            //   897e28               | mov                 dword ptr [esi + 0x28], edi
            //   894708               | mov                 dword ptr [edi + 8], eax

        $sequence_4 = { e9???????? d9ee 84cd 0f8462770000 d9e0 }
            // n = 5, score = 100
            //   e9????????           |                     
            //   d9ee                 | fldz                
            //   84cd                 | test                ch, cl
            //   0f8462770000         | je                  0x7768
            //   d9e0                 | fchs                

        $sequence_5 = { 0f2805???????? c78528feffffe4954200 66c7855cfeffff0001 c78580feffff00000000 }
            // n = 4, score = 100
            //   0f2805????????       |                     
            //   c78528feffffe4954200     | mov    dword ptr [ebp - 0x1d8], 0x4295e4
            //   66c7855cfeffff0001     | mov    word ptr [ebp - 0x1a4], 0x100
            //   c78580feffff00000000     | mov    dword ptr [ebp - 0x180], 0

        $sequence_6 = { 8d4f0c e8???????? 8bf8 8b4e44 49 807e0400 894e48 }
            // n = 7, score = 100
            //   8d4f0c               | lea                 ecx, [edi + 0xc]
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   8b4e44               | mov                 ecx, dword ptr [esi + 0x44]
            //   49                   | dec                 ecx
            //   807e0400             | cmp                 byte ptr [esi + 4], 0
            //   894e48               | mov                 dword ptr [esi + 0x48], ecx

        $sequence_7 = { 0f8449030000 68???????? ff35???????? ffd6 a3???????? 85c0 }
            // n = 6, score = 100
            //   0f8449030000         | je                  0x34f
            //   68????????           |                     
            //   ff35????????         |                     
            //   ffd6                 | call                esi
            //   a3????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_8 = { ffd6 a3???????? 85c0 0f845f020000 68???????? ff35???????? ffd6 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   0f845f020000         | je                  0x265
            //   68????????           |                     
            //   ff35????????         |                     
            //   ffd6                 | call                esi

        $sequence_9 = { e8???????? 83c40c 85c0 0f8431010000 81ff???????? 0f849f000000 6a01 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   0f8431010000         | je                  0x137
            //   81ff????????         |                     
            //   0f849f000000         | je                  0xa5
            //   6a01                 | push                1

    condition:
        7 of them and filesize < 566272
}