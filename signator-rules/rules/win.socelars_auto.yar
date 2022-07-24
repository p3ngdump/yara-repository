rule win_socelars_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.socelars."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.socelars"
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
        $sequence_0 = { c645fc03 8d85a0feffff 50 8d8db8feffff 51 8d8d04ffffff e8???????? }
            // n = 7, score = 100
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3
            //   8d85a0feffff         | lea                 eax, [ebp - 0x160]
            //   50                   | push                eax
            //   8d8db8feffff         | lea                 ecx, [ebp - 0x148]
            //   51                   | push                ecx
            //   8d8d04ffffff         | lea                 ecx, [ebp - 0xfc]
            //   e8????????           |                     

        $sequence_1 = { 8b4dfc e8???????? 8b4dfc 8b5110 83ea01 8b45fc 895010 }
            // n = 7, score = 100
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b5110               | mov                 edx, dword ptr [ecx + 0x10]
            //   83ea01               | sub                 edx, 1
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   895010               | mov                 dword ptr [eax + 0x10], edx

        $sequence_2 = { 8bb50cfeffff b801000000 8b8d04feffff 66894708 8bbd10feffff 8b8508feffff 83c214 }
            // n = 7, score = 100
            //   8bb50cfeffff         | mov                 esi, dword ptr [ebp - 0x1f4]
            //   b801000000           | mov                 eax, 1
            //   8b8d04feffff         | mov                 ecx, dword ptr [ebp - 0x1fc]
            //   66894708             | mov                 word ptr [edi + 8], ax
            //   8bbd10feffff         | mov                 edi, dword ptr [ebp - 0x1f0]
            //   8b8508feffff         | mov                 eax, dword ptr [ebp - 0x1f8]
            //   83c214               | add                 edx, 0x14

        $sequence_3 = { e8???????? 83c40c 85c0 0f85f5000000 8b75f8 8b55d4 e9???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   0f85f5000000         | jne                 0xfb
            //   8b75f8               | mov                 esi, dword ptr [ebp - 8]
            //   8b55d4               | mov                 edx, dword ptr [ebp - 0x2c]
            //   e9????????           |                     

        $sequence_4 = { 8bce e8???????? 8b5c241c e9???????? 8b542414 8bcf e8???????? }
            // n = 7, score = 100
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8b5c241c             | mov                 ebx, dword ptr [esp + 0x1c]
            //   e9????????           |                     
            //   8b542414             | mov                 edx, dword ptr [esp + 0x14]
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     

        $sequence_5 = { e8???????? 8b45f0 83c801 8945f0 8b4508 8b4dfc 33cd }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   83c801               | or                  eax, 1
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33cd                 | xor                 ecx, ebp

        $sequence_6 = { f20f118424c0000000 f20f1005???????? f20f116c2478 f20f118424c8000000 83f825 745d 8bfa }
            // n = 7, score = 100
            //   f20f118424c0000000     | movsd    qword ptr [esp + 0xc0], xmm0
            //   f20f1005????????     |                     
            //   f20f116c2478         | movsd               qword ptr [esp + 0x78], xmm5
            //   f20f118424c8000000     | movsd    qword ptr [esp + 0xc8], xmm0
            //   83f825               | cmp                 eax, 0x25
            //   745d                 | je                  0x5f
            //   8bfa                 | mov                 edi, edx

        $sequence_7 = { c745fc00000000 837de800 7435 6a18 8b4de8 e8???????? 0fb64508 }
            // n = 7, score = 100
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   837de800             | cmp                 dword ptr [ebp - 0x18], 0
            //   7435                 | je                  0x37
            //   6a18                 | push                0x18
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   e8????????           |                     
            //   0fb64508             | movzx               eax, byte ptr [ebp + 8]

        $sequence_8 = { 8d4dd8 e8???????? 8b08 51 8d5588 52 8b4d10 }
            // n = 7, score = 100
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   e8????????           |                     
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   51                   | push                ecx
            //   8d5588               | lea                 edx, [ebp - 0x78]
            //   52                   | push                edx
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]

        $sequence_9 = { e8???????? 8be5 5d c3 e8???????? 8b45ec 8bce }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   e8????????           |                     
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8bce                 | mov                 ecx, esi

    condition:
        7 of them and filesize < 2151424
}